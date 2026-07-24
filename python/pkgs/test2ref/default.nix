{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  pdm-backend,

  # dependencies
  binaryornot,

  # tests
  pytest-cov-stub,
}:

buildPythonPackage (finalAttrs: {
  pname = "test2ref";
  version = "1.2.3";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "nbiotcloud";
    repo = "test2ref";
    tag = "v${finalAttrs.version}";
    hash = "sha256-20vE6o8yKphKxlfGo+lBZ1VlKyCVlNawlMYVcj4JAtY=";
  };

  build-system = [
    pdm-backend
  ];

  dependencies = [
    binaryornot
  ];

  pythonImportsCheck = [ "test2ref" ];
  meta = {
    description = "Testing Against Learned Reference Data";
    homepage = "https://github.com/nbiotcloud/test2ref";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
