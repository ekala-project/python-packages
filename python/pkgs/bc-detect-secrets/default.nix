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
}:

buildPythonPackage (finalAttrs: {
  pname = "bc-detect-secrets";
  version = "1.5.47";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bridgecrewio";
    repo = "detect-secrets";
    tag = finalAttrs.version;
    hash = "sha256-ykmOa29/ASEr+AG2SjhSUN8gLMeKpscDKsPtTTZ+cU8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    requests
    unidiff
  ];

  optional-dependencies = {
    word_list = [ pyahocorasick ];
    gibberish = [ gibberish-detector ];
  };
  pythonImportsCheck = [ "detect_secrets" ];

  meta = {
    description = "Tool to detect secrets in the code";
    homepage = "https://github.com/bridgecrewio/detect-secrets";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
