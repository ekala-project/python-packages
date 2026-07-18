{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "attrdict";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NckGmLVcaDlGCRF3F3qenAcToIYPDgSf69cmSczXe3A=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace attrdict/merge.py --replace-fail "from collections" "from collections.abc"
    substituteInPlace attrdict/mapping.py --replace-fail "from collections" "from collections.abc"
    substituteInPlace attrdict/default.py --replace-fail "from collections" "from collections.abc"
    substituteInPlace attrdict/mixins.py --replace-fail "from collections" "from collections.abc"
  '';

  dependencies = [ six ];

  pythonImportsCheck = [ "attrdict" ];

  meta = {
    description = "Dict with attribute-style access";
    homepage = "https://github.com/bcj/AttrDict";
    license = lib.licenses.mit;
  };
}
