{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "hdfury";
  version = "1.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "glenndehaan";
    repo = "python-hdfury";
    tag = finalAttrs.version;
    hash = "sha256-YR6/4Mf5zgxzNsUaDRd3QBGSuuDQehKK7ptczCdKFGI=";
  };

  build-system = [ hatchling ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "hdfury" ];

  # Module no tests
  doCheck = false;

  meta = {
    description = "Python client for HDFury devices";
    homepage = "https://github.com/glenndehaan/python-hdfury";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
