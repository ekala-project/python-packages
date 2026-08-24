{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "simple-pid";
  version = "2.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "m-lundberg";
    repo = "simple-pid";
    tag = "v${finalAttrs.version}";
    hash = "sha256-DKi0ODnhoY/Pqzd6Zlvd1gMlFtzivigO0xThz35TBf8=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [
    "simple_pid"
  ];

  doCheck = !stdenv.isDarwin;

  meta = {
    description = "A simple and easy to use PID controller in Python";
    homepage = "https://github.com/m-lundberg/simple-pid";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
