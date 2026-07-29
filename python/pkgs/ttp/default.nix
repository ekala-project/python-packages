{
  lib,
  buildPythonPackage,
  cerberus,
  configparser,
  deepdiff,
  fetchFromGitHub,
  geoip2,
  jinja2,
  netmiko,
  openpyxl,
  poetry-core,
  tabulate,
}:

buildPythonPackage {
  pname = "ttp";
  version = "0.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dmulyalin";
    repo = "ttp";
    tag = "0.10.1";
    hash = "sha256-A0McQRpSjr0EYIrHQExtBqMe+AmL+IGWaRHeexyvtvg=";
  };

  build-system = [ poetry-core ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.10.0"' 'version = "0.10.1"'
  '';

  dependencies = [
    cerberus
    configparser
    deepdiff
    geoip2
    jinja2
    netmiko
    openpyxl
    tabulate
  ];

  pythonImportsCheck = [ "ttp" ];

  meta = {
    description = "Template Text Parser";
    mainProgram = "ttp";
    homepage = "https://github.com/dmulyalin/ttp";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
