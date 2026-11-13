{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gibberish-detector,
  mock,
  pkgs,
  pyahocorasick,
  pyyaml,
  requests,
  responses,
  setuptools,
  unidiff,
  withGibberish ? true,
  withWordList ? true,
}:

buildPythonPackage (finalAttrs: {
  pname = "detect-secrets";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Yelp";
    repo = "detect-secrets";
    tag = "v${finalAttrs.version}";
    hash = "sha256-VSq9x77OAVadPTqTAhxfx5+HKqXQ+ZTENHdoCuYSFdk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    requests
  ]
  ++ lib.optionals withGibberish finalAttrs.optional-dependencies.gibberish
  ++ lib.optionals withWordList finalAttrs.optional-dependencies.word_list;

  optional-dependencies = {
    gibberish = [
      gibberish-detector
    ];
    word_list = [
      pyahocorasick
    ];
  };
  pythonImportsCheck = [ "detect_secrets" ];

  meta = {
    description = "Enterprise friendly way of detecting and preventing secrets in code";
    homepage = "https://github.com/Yelp/detect-secrets";
    license = lib.licenses.asl20;
  };
})
