{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  tomli,
}:

buildPythonPackage rec {
  pname = "pep517";
  version = "0.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Gy+i/9OTi7S+/+XWFGy8sr2plqWk2p8xq//Ysk4Hsxc=";
  };

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [
    tomli
  ];
  meta = {
    description = "Wrappers to build Python packages using PEP 517 hooks";
    license = lib.licenses.mit;
    homepage = "https://github.com/pypa/pep517";
  };
}
