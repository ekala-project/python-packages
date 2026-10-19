{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jamo";
  version = "0.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "JDongian";
    repo = "python-jamo";
    tag = "v${finalAttrs.version}";
    hash = "sha256-QHI3Rqf1aQOsW49A/qnIwRnPuerbtyerf+eWIiEvyho=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jamo" ];

  meta = {
    changelog = "https://github.com/JDongian/python-jamo/releases/tag/v${finalAttrs.version}";
    description = "Hangul syllable decomposition and synthesis using jamo";
    homepage = "https://github.com/JDongian/python-jamo";
    license = lib.licenses.asl20;
  };
})
