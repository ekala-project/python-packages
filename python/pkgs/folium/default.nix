{
  lib,
  buildPythonPackage,
  branca,
  fetchFromGitHub,
  fetchpatch2,
  jinja2,
  numpy,
  requests,
  setuptools,
  setuptools-scm,
  xyzservices,
}:

buildPythonPackage rec {
  pname = "folium";
  version = "0.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-visualization";
    repo = "folium";
    tag = "v${version}";
    hash = "sha256-yLF4TdrMVEtWvGXZGbwa3OxCkdXMsN4m45rPrGDHlCU=";
  };

  patches = [
    # https://github.com/python-visualization/folium/pull/2223
    (fetchpatch2 {
      name = "folium-fix-tests-proj-9.8.1";
      url = "https://github.com/python-visualization/folium/commit/b4ea8aa12d0808536c4f50b63eddd006e68680cb.patch?full_index=1";
      hash = "sha256-e6PFvK/qAfVTPs8LF2XgojwFJ/s2PDrIuwEkxRUzSkE=";
    })
  ];

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    branca
    jinja2
    numpy
    requests
    xyzservices
  ];
  pythonImportsCheck = [ "folium" ];

  meta = {
    description = "Make beautiful maps with Leaflet.js & Python";
    homepage = "https://github.com/python-visualization/folium";
    license = lib.licenses.mit;
    teams = [ lib.teams.geospatial ];
  };
}
