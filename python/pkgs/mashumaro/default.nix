{
  lib,
  buildPythonPackage,
  ciso8601,
  fetchFromGitHub,
  msgpack,
  orjson,
  pendulum,
  pytest-mock,
  pyyaml,
  setuptools,
  tomli-w,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "mashumaro";
  version = "3.22";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Fatal1ty";
    repo = "mashumaro";
    tag = "v${version}";
    hash = "sha256-/aAyylHOEjSmcjb+OKDNY0OOlR2JXepvVpVsfGbKSyw=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  optional-dependencies = {
    orjson = [ orjson ];
    msgpack = [ msgpack ];
    yaml = [ pyyaml ];
    toml = [ tomli-w ];
  };
  meta = {
    description = "Serialization library on top of dataclasses";
    homepage = "https://github.com/Fatal1ty/mashumaro";
    license = lib.licenses.asl20;
  };
}
