{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  python-dateutil,
  requests,
  setuptools,
  sphinx-rtd-theme,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-tes";
  version = "1.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ohsu-comp-bio";
    repo = "py-tes";
    tag = finalAttrs.version;
    hash = "sha256-/xgycSDFp17rPzC6ICf4e+vrIKWYPftDngx/u1/KHWk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    python-dateutil
    requests
    sphinx-rtd-theme
  ];

  pythonImportsCheck = [ "tes" ];

  meta = {
    description = "Python SDK for the GA4GH Task Execution API";
    homepage = "https://github.com/ohsu-comp-bio/py-tes";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
