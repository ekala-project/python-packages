{ lib
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, attrs
, cattrs
, lsprotocol
, websockets
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygls";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openlawlibrary";
    repo = "pygls";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jxc1nKxfiRenb629a2WCZOzqyIOvT5XU4NrjmKPlDHk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    attrs
    cattrs
    lsprotocol
  ];

  optional-dependencies = {
    ws = [ websockets ];
  };

  # Fixes hanging tests on Darwin
  pythonImportsCheck = [ "pygls" ];

  meta = {
    description = "Pythonic generic implementation of the Language Server Protocol";
    homepage = "https://github.com/openlawlibrary/pygls";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
