{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  flit-core
, # optional-dependencies
  numpy
, packaging
, typing-extensions
, zipp
,
}:

buildPythonPackage (finalAttrs: {
  pname = "etils";
  version = "1.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "etils";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gjWA+y1dXihmOBzCxfgUZJLvtSHzpRLQIhNxzk+y11M=";
  };

  build-system = [ flit-core ];

  optional-dependencies = {
    enp = [
      numpy
    ];
    epath = [
      typing-extensions
      zipp
    ];
    epy = [ typing-extensions ];
  };

  pythonImportsCheck = [ "etils" ];

  meta = {
    description = "Collection of eclectic utils";
    homepage = "https://github.com/google/etils";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
