{ pkgs, ... }:
let
  dump-project = pkgs.writeShellScriptBin "dump-project" ''
    #!/usr/bin/env bash
    # dump-project - Universal project dumper
    # Concatenates all important project files into test.blank

    set -euo pipefail

    OUTFILE="test.blank"

    # Function to detect project type and get relevant patterns
    detect_project_type() {
        local project_types=()

        # Check for various project indicators
        [[ -f flake.nix ]] && project_types+=("nix")
        [[ -f package.json ]] && project_types+=("node")
        [[ -f Cargo.toml ]] && project_types+=("rust")
        [[ -f pyproject.toml || -f setup.py || -f requirements.txt ]] && project_types+=("python")
        [[ -f go.mod ]] && project_types+=("go")
        [[ -f pom.xml || -f build.gradle ]] && project_types+=("java")
        [[ -f Makefile || -f CMakeLists.txt ]] && project_types+=("c/cpp")
        [[ -f composer.json ]] && project_types+=("php")
        [[ -f Gemfile ]] && project_types+=("ruby")
        [[ -f mix.exs ]] && project_types+=("elixir")
        [[ -f stack.yaml || -f *.cabal ]] && project_types+=("haskell")
        [[ -f deno.json || -f deno.jsonc ]] && project_types+=("deno")
        [[ -d .git ]] && project_types+=("git")

        if [[ ''${#project_types[@]} -eq 0 ]]; then
            project_types+=("generic")
        fi

        printf '%s\n' "''${project_types[@]}"
    }

    # Function to get file patterns based on project type
    get_file_patterns() {
        local project_type="$1"

        case "$project_type" in
            nix)
                echo "*.nix *.yaml *.yml *.toml *.json *.conf *.config *.sh *.zsh *.fish"
                ;;
            node)
                echo "*.js *.ts *.jsx *.tsx *.json *.md *.yml *.yaml package*.json tsconfig.json .env*"
                ;;
            rust)
                echo "*.rs *.toml *.md Cargo.* .env*"
                ;;
            python)
                echo "*.py *.pyi *.pyx *.toml *.txt *.cfg *.ini *.md *.yml *.yaml setup.py pyproject.toml requirements*.txt .env*"
                ;;
            go)
                echo "*.go *.mod *.sum *.md *.yml *.yaml .env*"
                ;;
            java)
                echo "*.java *.kt *.xml *.gradle *.properties *.md *.yml *.yaml .env*"
                ;;
            "c/cpp")
                echo "*.c *.cpp *.h *.hpp *.cc *.cxx *.hxx *.cmake CMakeLists.txt Makefile *.md .env*"
                ;;
            php)
                echo "*.php *.json *.xml *.md *.yml *.yaml composer.* .env*"
                ;;
            ruby)
                echo "*.rb *.gemspec Gemfile* *.md *.yml *.yaml .env*"
                ;;
            elixir)
                echo "*.ex *.exs *.eex *.leex *.heex mix.* *.md *.yml *.yaml .env*"
                ;;
            haskell)
                echo "*.hs *.lhs *.cabal *.yaml stack.yaml *.md .env*"
                ;;
            deno)
                echo "*.ts *.js *.tsx *.jsx *.json *.md deno.* .env*"
                ;;
            *)
                echo "*.md *.txt *.json *.yaml *.yml *.toml *.ini *.cfg *.conf *.config *.sh *.bash *.zsh *.fish .env*"
                ;;
        esac
    }

    # Function to get directories to exclude
    get_exclude_dirs() {
        echo ".git node_modules .direnv .github .vscode target build dist out __pycache__ .pytest_cache .mypy_cache .tox venv .venv env .env bin obj .gradle .idea .next .nuxt coverage .nyc_output logs tmp temp .cache result"
    }

    # Function to get files to exclude
    get_exclude_files() {
        echo "*.lock *.backup *.tmp *~ .DS_Store *.log *.pid *.seed *.pid.lock *.tgz *.tar.gz *.zip *.rar *.7z *.exe *.dll *.so *.dylib *.o *.obj *.class *.pyc *.pyo"
    }

    # Main function
    main() {
        echo "Detecting project type(s) in: $PWD"

        # Detect project types
        local project_types=($(detect_project_type))
        echo "Detected project type(s): ''${project_types[*]}"

        # Clear the output file or create it
        : > "$OUTFILE"

        # Get file patterns for all detected project types
        local all_patterns=()
        for project_type in "''${project_types[@]}"; do
            local patterns=($(get_file_patterns "$project_type"))
            all_patterns+=("''${patterns[@]}")
        done

        # Remove duplicates and sort
        local unique_patterns=($(printf '%s\n' "''${all_patterns[@]}" | sort -u))

        echo "Searching for files matching: ''${unique_patterns[*]}"

        # Get exclude patterns
        local exclude_dirs=($(get_exclude_dirs))
        local exclude_files=($(get_exclude_files))

        # Build find command for excluded directories
        local find_excludes=()
        for dir in "''${exclude_dirs[@]}"; do
            find_excludes+=(-type d -name "$dir" -prune -o)
        done

        # Build find command for file patterns
        local find_patterns=()
        for pattern in "''${unique_patterns[@]}"; do
            find_patterns+=(-name "$pattern" -o)
        done
        # Remove the last -o
        if [[ ''${#find_patterns[@]} -gt 0 ]]; then
            unset 'find_patterns[-1]'
        fi

        # Find and process files
        find . "''${find_excludes[@]}" \
            -type f \( "''${find_patterns[@]}" \) \
            $(printf ' ! -name %q' "''${exclude_files[@]}") \
            ! -name "$OUTFILE" \
            -print0 | sort -z | while IFS= read -r -d ''' file; do
                # Skip binary files
                if file "$file" | grep -q "text\|empty"; then
                    echo "Processing: $file"
                    echo -e "\n# ---- $file ----\n" >> "$OUTFILE"
                    cat "$file" >> "$OUTFILE"
                fi
            done

        # Check if any files were appended
        if [[ -s "$OUTFILE" ]]; then
            local file_count=$(grep -c "^# ---- .* ----$" "$OUTFILE" || echo "0")
            local line_count=$(wc -l < "$OUTFILE")
            echo "Combined $file_count files ($line_count lines) written to $OUTFILE"
            echo "Project: $PWD"
            echo "Output: $PWD/$OUTFILE"
        else
            echo "No files were found to combine into $OUTFILE"
            exit 1
        fi
    }

    main "$@"
  '';
in
{
  # Install the script system-wide
  environment.systemPackages = [ dump-project ];
}
