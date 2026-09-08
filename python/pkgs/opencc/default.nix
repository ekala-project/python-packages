{
  lib,
  buildPythonPackage,
  fetchPypi,
  cmake,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "opencc";
  version = "1.4.2";
  format = "setuptools";

  src = fetchPypi {
    pname = "opencc";
    inherit version;
    hash = "sha256-R5d5BfEx19nPzsKful2EEVSQfh2nMQMQWkpodE4PTxo=";
  };

  nativeBuildInputs = [
    cmake
    setuptools
    wheel
  ];

  dontUseCmakeConfigure = true;

  pythonImportsCheck = [
    "opencc"
  ];

  meta = {
    description = "Python bindings for OpenCC (Conversion between Traditional and Simplified Chinese)";
    homepage = "https://github.com/BYVoid/OpenCC";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
