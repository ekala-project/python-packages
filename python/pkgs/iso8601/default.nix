{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "iso8601";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ax04Ke6JIcQwGZjJCfeCn6ntPL2sDTsWry10Ou0bqN8=";
  };

  nativeBuildInputs = [ poetry-core ];

  pythonImportsCheck = [ "iso8601" ];

  meta = {
    description = "Simple module to parse ISO 8601 dates";
    homepage = "https://pyiso8601.readthedocs.io/";
    license = with lib.licenses; [ mit ];
  };
}
