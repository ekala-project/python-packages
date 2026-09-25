{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mkdocs,
}:

buildPythonPackage rec {
  pname = "mkdocs-gen-files";
  version = "0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oprypin";
    repo = "mkdocs-gen-files";
    tag = "v${version}";
    hash = "sha256-2TMQHn6eP+RMjtJ4o/6G8k1TEIlGgr7U/Fim14MJELg=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"properdocs >=' '#"properdocs >='
  '';

  build-system = [
    hatchling
  ];

  dependencies = [
    mkdocs
  ];

  pythonImportsCheck = [
    "mkdocs_gen_files"
  ];

  meta = {
    description = "MkDocs plugin to programmatically generate documentation pages during the build";
    homepage = "https://oprypin.github.io/mkdocs-gen-files/";
    license = lib.licenses.mit;
  };
}
