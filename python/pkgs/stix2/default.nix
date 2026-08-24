{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytz,
  requests,
  simplejson,
  stix2-patterns,
}:

buildPythonPackage (finalAttrs: {
  pname = "stix2";
  version = "3.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oasis-open";
    repo = "cti-python-stix2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qm6VFufD9A4rSBHaDkqeYqOLRvE97SY0++o4ND0l3I0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pytz
    requests
    simplejson
    stix2-patterns
  ];

  pythonImportsCheck = [ "stix2" ];

  meta = {
    description = "Produce and consume STIX 2 JSON content";
    homepage = "https://stix2.readthedocs.io/en/latest/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
