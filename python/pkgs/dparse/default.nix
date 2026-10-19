{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  packaging,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "dparse";
  version = "0.6.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyupio";
    repo = "dparse";
    tag = finalAttrs.version;
    hash = "sha256-LnsmJtWLjV3xoSjacfR9sUwPlOjQTRBWirJVtIJSE8A=";
  };

  build-system = [ hatchling ];

  dependencies = [ packaging ];

  optional-dependencies = {
    # FIXME pipenv = [ pipenv ];
    conda = [ pyyaml ];
  };
  meta = {
    description = "Parser for Python dependency files";
    homepage = "https://github.com/pyupio/dparse";
    license = lib.licenses.mit;
  };
})
