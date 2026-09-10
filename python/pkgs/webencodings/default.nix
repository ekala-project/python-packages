{
  buildPythonPackage,
  lib,
  fetchPypi,
  flit-core,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "webencodings";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Vl+a0DHHAtrkBOJ6CZ4+CRhqOrG5Ug8G0hVQK2Uf2RA=";
  };

  build-system = [ flit-core ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "webencodings" ];

  meta = {
    description = "Character encoding aliases for legacy web content";
    homepage = "https://github.com/CourtBouillon/webencodings";
    license = lib.licenses.bsd3;
  };
}
