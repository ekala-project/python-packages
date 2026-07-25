{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools_80,
  six,
  nix-update-script,
}:

buildPythonPackage rec {
  pname = "wirerope";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "youknowone";
    repo = "wirerope";
    rev = version;
    hash = "sha256-oojnv+2+nwL/TJhN+QZ5eiV6WGHC3SCxBQrCri0aHQc=";
  };

  build-system = [ setuptools_80 ];

  dependencies = [ six ];

  pythonImportsCheck = [ "wirerope" ];
  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Wrappers for class callables";
    homepage = "https://github.com/youknowone/wirerope";
    license = lib.licenses.bsd2WithViews;
    maintainers = [ ];
  };
}
