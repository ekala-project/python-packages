{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  packaging,
  pandas,
  pyogrio,
  pyproj,
  shapely,

  # optional-dependencies
  folium,
  geoalchemy2,
  geopy,
  mapclassify,
  matplotlib,
  psycopg,
  pyarrow,
  sqlalchemy,
  xyzservices,
}:

buildPythonPackage (finalAttrs: {
  pname = "geopandas";
  version = "1.1.4";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "geopandas";
    repo = "geopandas";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7XWPPLuJjc6x+Vb16z0bEjYe1lX710vz5Rwjg/WFHH0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    packaging
    pandas
    pyogrio
    pyproj
    shapely
  ];

  optional-dependencies = {
    all = [
      (folium.overridePythonAttrs (prevAttrs: {
        doCheck = false;
      }))
      geoalchemy2
      geopy
      (mapclassify.overridePythonAttrs (prevAttrs: {
        doCheck = false;
      }))
      matplotlib
      psycopg
      pyarrow
      sqlalchemy
      xyzservices
    ];
  };

  pythonImportsCheck = [ "geopandas" ];

  meta = {
    description = "Python geospatial data analysis framework";
    homepage = "https://geopandas.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
