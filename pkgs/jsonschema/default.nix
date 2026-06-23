{
  lib,
  attrs,
  buildPythonPackage,
  fetchPypi,
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,
  jsonpath-ng,
  jsonschema-specifications,
  referencing,
  rpds-py,

  # optionals
  fqdn,
  idna,
  isoduration,
  jsonpointer,
  rfc3339-validator,
  rfc3986-validator,
  uri-template,
  webcolors,
}:

buildPythonPackage rec {
  pname = "jsonschema";
  version = "4.26.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DCZwfi762Kob/Ft84XDz/MwuSRj/hZibqf+p+ssr4yY=";
  };

  postPatch = ''
    patchShebangs json/bin/jsonschema_suite
  '';

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  dependencies = [
    attrs
    jsonpath-ng
    jsonschema-specifications
    referencing
    rpds-py
  ];

  optional-dependencies = {
    format = [
      fqdn
      idna
      isoduration
      jsonpointer
      rfc3339-validator
      uri-template
      webcolors
    ];
    format-nongpl = [
      fqdn
      idna
      isoduration
      jsonpointer
      rfc3339-validator
      rfc3986-validator
      uri-template
      webcolors
    ];
  };

  pythonImportsCheck = [ "jsonschema" ];

  meta = {
    description = "Implementation of JSON Schema validation";
    homepage = "https://github.com/python-jsonschema/jsonschema";
    license = lib.licenses.mit;
    mainProgram = "jsonschema";
  };
}
