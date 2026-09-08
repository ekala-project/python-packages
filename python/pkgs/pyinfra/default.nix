{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  uv-dynamic-versioning,
  # dependencies
  click,
  distro,
  gevent,
  jinja2,
  packaging,
  paramiko,
  pydantic,
  python-dateutil,
  typeguard,
  types-paramiko,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyinfra";
  version = "3.10.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pyinfra-dev";
    repo = "pyinfra";
    tag = "v${finalAttrs.version}";
    hash = "sha256-b1z6ZHt/fbDplJXZMx3/Ao/I9f4KHJcG1hmnWCLJJwY=";
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
