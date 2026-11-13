{
  lib,
  buildPythonPackage,
  fetchPypi,
  bleach,
  bokeh,
  linkify-it-py,
  markdown,
  markdown-it-py,
  mdit-py-plugins,
  narwhals,
  pandas,
  param,
  pyviz-comms,
  pyct,
  requests,
  setuptools,
  tqdm,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "panel";
  version = "1.10.0";

  format = "wheel";

  # We fetch a wheel because while we can fetch the node
  # artifacts using npm, the bundling invoked in setup.py
  # tries to fetch even more artifacts
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    format = "wheel";
    hash = "sha256-Fcnyu1hWep42oiOWyzh3bfd+sMxSzZqZzrt4QksDY8A=";
    dist = "py3";
    python = "py3";
  };

  pythonRelaxDeps = [ "bokeh" ];

  dependencies = [
    bleach
    bokeh
    linkify-it-py
    markdown
    markdown-it-py
    mdit-py-plugins
    narwhals
    pandas
    param
    pyct
    pyviz-comms
    requests
    setuptools
    tqdm
    typing-extensions
  ];

  pythonImportsCheck = [ "panel" ];

  # infinite recursion in test dependencies (hvplot)

  meta = {
    description = "High level dashboarding library for python visualization libraries";
    mainProgram = "panel";
    homepage = "https://github.com/holoviz/panel";
    license = lib.licenses.bsd3;
  };
})
