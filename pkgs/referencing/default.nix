{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  rpds-py,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "referencing";
  version = "0.37.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-jsonschema";
    repo = "referencing";
    tag = "v${version}";
    hash = "sha256-cuy9NS4PtfBILjw9gv7GRfheKez4FEf8ym94/O6nNcE=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    attrs
    rpds-py
    typing-extensions
  ];

  pythonImportsCheck = [ "referencing" ];

  meta = {
    description = "Cross-specification JSON referencing";
    homepage = "https://github.com/python-jsonschema/referencing";
    license = lib.licenses.mit;
  };
}
