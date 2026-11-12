{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "docker-pycreds";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "shin-";
    repo = "dockerpy-creds";
    tag = finalAttrs.version;
    hash = "sha256-yYsMsRW6Bb8vmwT0mPjs0pRqBbznGtHnGb3JNHjLjys=";
  };

  build-system = [
    setuptools
  ];

  # distutils was removed in Python 3.12
  postPatch = ''
    substituteInPlace dockerpycreds/utils.py \
      --replace-fail "import distutils.spawn" "import shutil" \
      --replace-fail "distutils.spawn.find_executable(executable, path)" "shutil.which(executable, path=path)"
  '';

  dependencies = [ six ];

  pythonImportsCheck = [ "dockerpycreds" ];

  # require docker-credential-helpers binaries

  meta = {
    description = "Python bindings for the docker credentials store API";
    homepage = "https://github.com/shin-/dockerpy-creds";
    license = lib.licenses.asl20;
  };
})
