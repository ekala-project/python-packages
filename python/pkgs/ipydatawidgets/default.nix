{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  jupyter-packaging,
  ipywidgets,
  numpy,
  six,
  traittypes,
}:

buildPythonPackage (finalAttrs: {

  pname = "ipydatawidgets";
  version = "4.3.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OU8kiVdlh8/XVTd6CaBn9GytIggZZQkgIf0avL54Uqg=";
  };

  # The sdist ships the prebuilt extensions; jupyterlab and the intermediate
  # jlabextension/build output are only needed to rebuild them
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"jupyterlab==3.*", ' ""
    substituteInPlace setup.py \
      --replace-fail "os.path.join(here, 'packages', 'jlabextension', 'build', 'index.js')," ""
  '';

  build-system = [ setuptools ];

  nativeBuildInputs = [ jupyter-packaging ];

  setupPyBuildFlags = [ "--skip-npm" ];

  dependencies = [
    ipywidgets
    numpy
    six
    traittypes
  ];

  meta = {
    description = "Widgets to help facilitate reuse of large datasets across different widgets";
    homepage = "https://github.com/vidartf/ipydatawidgets";
    license = lib.licenses.bsd3;
  };
})
