{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  pytest,
  jinja2,
  matplotlib,
  packaging,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-mpl";
  version = "0.19.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matplotlib";
    repo = "pytest-mpl";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qSOGGq2lOikm3kwZmGI1hFkuPU+zuh0iGL9TbH6ktEQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [
    jinja2
    matplotlib
    packaging
    pillow
  ];
  # need to set MPLBACKEND=agg for headless matplotlib for darwin
  # https://github.com/matplotlib/matplotlib/issues/26292
  # The default tolerance is too strict in our build environment
  # https://github.com/matplotlib/pytest-mpl/pull/9
  # https://github.com/matplotlib/pytest-mpl/issues/225
  meta = {
    description = "Pytest plugin to help with testing figures output from Matplotlib";
    homepage = "https://github.com/matplotlib/pytest-mpl";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
