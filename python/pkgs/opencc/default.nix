{
  lib,
  buildPythonPackage,
  fetchPypi,
  cmake,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "opencc";
  version = "1.4.2";
  pyproject = true;

  src = fetchPypi {
    pname = "opencc";
    inherit (finalAttrs) version;
    hash = "sha256-R5d5BfEx19nPzsKful2EEVSQfh2nMQMQWkpodE4PTxo=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cmake ];

  dontUseCmakeConfigure = true;

  pythonImportsCheck = [
    "opencc"
  ];

  meta = {
    description = "Python bindings for OpenCC (Conversion between Traditional and Simplified Chinese)";
    homepage = "https://github.com/BYVoid/OpenCC";
    license = lib.licenses.asl20;
  };
})
