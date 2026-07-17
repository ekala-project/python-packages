{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-editor";
  version = "1.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Uf2mvMXdu7cGOyr3UJ5DvYS/wypP9xNJ7HhHcTiCMns=";
  };

  build-system = [ setuptools ];

  # editor.py imports distutils.spawn which was removed in Python 3.12+
  dependencies = [ setuptools ];

  # import fails on Python 3.13+ due to distutils removal
  dontUsePythonImportsCheck = true;

  meta = {
    homepage = "https://github.com/fmoo/python-editor";
    description = "Programmatically open an editor, capture the result";
    license = lib.licenses.asl20;
  };
}
