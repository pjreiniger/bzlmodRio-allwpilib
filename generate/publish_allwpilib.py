

def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    registry_location = os.path.join(SCRIPT_DIR, "..", '..', "bazel-central-registry")
    
    module_json_template = os.path.join(SCRIPT_DIR, "module_config.json.jinja2")
    
    generate_json(registry_location, group, module_json_template)


if __name__ == "__main__":
    main()