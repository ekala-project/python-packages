{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
, requests
,
}:

buildPythonPackage (finalAttrs: {
  pname = "prawcore";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "praw-dev";
    repo = "prawcore";
    tag = "v${finalAttrs.version}";
    hash = "sha256-tECZRx6VgyiJDKHvj4Rf1sknFqUhz3sDFEsAMOeB7/g=";
  };

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [ requests ];

  pythonImportsCheck = [ "prawcore" ];

  meta = {
    description = "Low-level communication layer for PRAW";
    homepage = "https://praw.readthedocs.org/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
