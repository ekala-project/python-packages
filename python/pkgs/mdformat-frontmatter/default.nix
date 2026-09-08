{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  mdformat,
  mdit-py-plugins,
  ruamel-yaml,

  # tests
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "mdformat-frontmatter";
  version = "2.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "butler54";
    repo = "mdformat-frontmatter";
    tag = "v${finalAttrs.version}";
    hash = "sha256-AnSEaEbXm4n7FLwM/z/bv1k9EGSc02qF9lWehRSf3V4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    mdformat
    mdit-py-plugins
    ruamel-yaml
  ];

  pythonImportsCheck = [ "mdformat_frontmatter" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "Mdformat plugin to ensure frontmatter is respected";
    homepage = "https://github.com/butler54/mdformat-frontmatter";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
