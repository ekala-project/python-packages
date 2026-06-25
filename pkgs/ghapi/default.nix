{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fastcore,
  packaging,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ghapi";
  version = "1.0.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastai";
    repo = "ghapi";
    tag = finalAttrs.version;
    hash = "sha256-Xv48jY5PW8JdzdWktNOtWAUmn5voWlNv1TqcNmc09zE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    fastcore
    packaging
  ];

  pythonImportsCheck = [ "ghapi" ];

  meta = {
    description = "Python interface to GitHub's API";
    homepage = "https://github.com/fastai/ghapi";
    license = lib.licenses.asl20;
  };
})
