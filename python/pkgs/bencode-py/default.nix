{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pbr,
  pytestCheckHook,
}:
buildPythonPackage (finalAttrs: {
  pname = "bencode-py";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "bencode_py";
    hash = "sha256-+TNytF3DcP5AJPkjASjx+fvA/jDD1B8cOn0C/myJmBM=";
  };

  build-system = [
    setuptools
    pbr
  ];

  pythonImportsCheck = [ "bencodepy" ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Simple bencode parser (for Python 2, Python 3 and PyPy)";
    homepage = "https://github.com/fuzeman/bencode.py";
    license = lib.licenses.bitTorrent11;
  };
})
