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

buildPythonPackage rec {
  pname = "panel";
  version = "1.9.4";

  format = "wheel";

  # We fetch a wheel because while we can fetch the node
  # artifacts using npm, the bundling invoked in setup.py
  # tries to fetch even more artifacts
  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    hash = "sha256-yJxMHnKCl9rwYo6lBw+w2orXd4HioxQtMCR5U3wd5qQ=";
    dist = "py3";
    python = "py3";
  };

  # Fix compatibility with bokeh 3.10.0 which no longer auto-unpacks
  # typing.Literal in enumeration() (upstream fix: holoviz/panel#8716)
  postInstall = ''
    substituteInPlace $out/lib/python*/site-packages/panel/_param.py \
      --replace-fail 'Alignment = enumeration(AlignmentType)' \
        'Alignment = enumeration(*t.get_args(AlignmentType))'
  '';

  pythonRelaxDeps = [ "bokeh" ];

  propagatedBuildInputs = [
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
  doCheck = false;

  meta = {
    description = "High level dashboarding library for python visualization libraries";
    mainProgram = "panel";
    homepage = "https://github.com/holoviz/panel";
    license = lib.licenses.bsd3;
  };
}
