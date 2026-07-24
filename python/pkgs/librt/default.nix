{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "librt";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mypyc";
    repo = "librt";
    tag = "v${version}";
    hash = "sha256-RZGaOq8hmkwekCs1fKshDrx3vmHdJl/wI3IO9ZLH5rc=";
  };

  postPatch = ''
    cp -rv lib-rt/* .
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "librt"
    "librt.internal"
  ];

  meta = {
    description = "Mypyc runtime library";
    homepage = "https://github.com/mypyc/librt";
    license = lib.licenses.mit;
  };
}
