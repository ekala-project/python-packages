{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dash-html-components";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "dash_html_components";
    inherit (finalAttrs) version;
    sha256 = "8703a601080f02619a6390998e0b3da4a5daabe97a1fd7a9cebc09d015f26e50";
  };

  build-system = [ setuptools ];

  # No tests in archive

  meta = {
    description = "HTML components for Dash";
    homepage = "https://dash.plot.ly/dash-html-components";
    license = lib.licenses.mit;
  };
})
