{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pathtools";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fDXFQho5u4LlgBj+vZDjtuXbNMVEOqr3QrPzPUZV8cA=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "import imp" "import importlib" \
      --replace-fail "imp.load_source('version'," "importlib.machinery.SourceFileLoader('version'," \
      --replace-fail "os.path.join(PKG_DIR, 'version.py'))" "os.path.join(PKG_DIR, 'version.py')).load_module()"
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pathtools" ];

  meta = {
    homepage = "https://github.com/gorakhargosh/pathtools";
    description = "Pattern matching and various utilities for file systems paths";
    license = lib.licenses.mit;
  };
}
