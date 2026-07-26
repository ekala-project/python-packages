{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  jsonschema,
  numpy,
  pillow,
  pydantic,
  pydantic-extra-types,
  requests,
  tiktoken,
  typing-extensions,

  # optional-dependencies
  click,
  fastapi,
  huggingface-hub,
  jinja2,
  llguidance,
  opencv-python-headless,
  pydantic-settings,
  sentencepiece,
  soundfile,
  soxr,
  uvloop,
}:

buildPythonPackage (finalAttrs: {
  pname = "mistral-common";
  version = "1.11.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mistralai";
    repo = "mistral-common";
    tag = "v${finalAttrs.version}";
    hash = "sha256-UFnj31YG0VAzbTJ6V77YSF/xlDNu7S6dtoPjjVVquVw=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    jsonschema
    numpy
    pillow
    pydantic
    pydantic-extra-types
    requests
    tiktoken
    typing-extensions
  ];

  optional-dependencies =
    let
      self = finalAttrs.finalPackage.optional-dependencies;
    in
    {
      opencv = [
        opencv-python-headless
      ];
      sentencepiece = [
        sentencepiece
      ];
      soundfile = [
        soundfile
      ];
      soxr = [
        soxr
      ];
      audio = self.soundfile ++ self.soxr;
      image = self.opencv;
      guidance = [
        jinja2
        llguidance
      ];
      hf-hub = [
        huggingface-hub
      ];
      server = [
        click
        fastapi
        pydantic-settings
        uvloop
      ]
      ++ fastapi.optional-dependencies.standard;
      all =
        self.opencv
        ++ self.sentencepiece
        ++ self.audio
        ++ self.image
        ++ self.guidance
        ++ self.hf-hub
        ++ self.server;
    };

  pythonImportsCheck = [ "mistral_common" ];
  meta = {
    description = "Tools to help you work with Mistral models";
    homepage = "https://github.com/mistralai/mistral-common";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
