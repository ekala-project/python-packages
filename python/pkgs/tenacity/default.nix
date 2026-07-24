{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "tenacity";
  version = "9.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jd";
    repo = "tenacity";
    tag = finalAttrs.version;
    hash = "sha256-JiWfIlStps3HZQw4KEohKAUWWZtMAuluXXzvqU+p8V4=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "tenacity" ];

  meta = {
    homepage = "https://github.com/jd/tenacity";
    description = "Retrying library for Python";
    license = lib.licenses.asl20;
  };
})
