{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "argparse-dataclass";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mivade";
    repo = "argparse_dataclass";
    tag = finalAttrs.version;
    hash = "sha256-ASdP6LOEeTszyppYV6vRQX8BKOHYUimI36tMSZTQfTk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "argparse_dataclass" ];

  meta = {
    description = "Declarative CLIs with argparse and dataclasses";
    homepage = "https://github.com/mivade/argparse_dataclass";
    license = lib.licenses.mit;
  };
})
