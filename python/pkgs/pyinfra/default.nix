{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  hatchling
, uv-dynamic-versioning
, # dependencies
  click
, distro
, gevent
, jinja2
, packaging
, paramiko
, pydantic
, python-dateutil
, typeguard
, types-paramiko
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyinfra";
  version = "3.9.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pyinfra-dev";
    repo = "pyinfra";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5qgPfBtPqysEtNCLFAgGAxlVK/CRH9VYmiC/98VWomI=";
  };

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  dependencies = [
    click
    distro
    gevent
    jinja2
    packaging
    paramiko
    pydantic
    python-dateutil
    typeguard
    types-paramiko
  ];

  pythonImportsCheck = [ "pyinfra" ];

  pythonRelaxDeps = [
    "paramiko"
  ];

  meta = {
    description = "Python-based infrastructure automation";
    homepage = "https://pyinfra.com";
    downloadPage = "https://pyinfra.com/Fizzadar/pyinfra/releases";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pyinfra";
  };
})
