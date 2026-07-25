{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

let
  zipp = buildPythonPackage rec {
    pname = "zipp";
    version = "4.1.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "jaraco";
      repo = "zipp";
      tag = "v${version}";
      hash = "sha256-qFsCud+fKDULbIF3LLGh6su/Sm1YjcvKe0+R9GH/Ies=";
    };

    postPatch = ''
      # Downloads license text at build time
      sed -i "/coherent\.licensed/d" pyproject.toml
    '';

    build-system = [
      setuptools
      setuptools-scm
    ];

    # Prevent infinite recursion with pytest
    doCheck = false;
    pythonImportsCheck = [ "zipp" ];
    meta = {
      description = "Pathlib-compatible object wrapper for zip files";
      homepage = "https://github.com/jaraco/zipp";
      license = lib.licenses.mit;
      maintainers = [ ];
    };
  };
in
zipp
