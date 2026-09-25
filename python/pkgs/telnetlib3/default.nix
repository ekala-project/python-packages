{
  blessed,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
  prettytable,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  pname = "telnetlib3";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jquast";
    repo = "telnetlib3";
    tag = finalAttrs.version;
    hash = "sha256-Gp76iTxzGGyLPhkJ1PaT9UZqD9jpfQdnB76XElyiV+8=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [
    "wcwidth"
  ];

  dependencies = [
    blessed
    wcwidth
  ];

  optional-dependencies = {
    extras = [
      prettytable
      # FIXME package ucs-detect
    ];
  };

  pythonImportsCheck = [ "telnetlib3" ];

  meta = {
    description = "Feature-rich Telnet Server, Client, and Protocol library for Python";
    homepage = "https://github.com/jquast/telnetlib3";
    license = lib.licenses.isc;
  };
})
