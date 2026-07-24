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

buildPythonPackage rec {
  pname = "detect-secrets";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Yelp";
    repo = "detect-secrets";
    tag = "v${version}";
    hash = "sha256-pNLAZUJhjZ3b01XaltJUJ9O7Blv6/pHQrRvURe7MJ5A=";
    leaveDotGit = true;
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    requests
  ]
  ++ lib.optionals withGibberish optional-dependencies.gibberish
  ++ lib.optionals withWordList optional-dependencies.word_list;

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
    maintainers = [ ];
  };
}
