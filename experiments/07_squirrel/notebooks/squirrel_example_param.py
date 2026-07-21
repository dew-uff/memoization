import sys
sys.path.append('/home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/novos/squirrel/notebooks')
from speedupy.speedupy import maybe_deterministic
import matplotlib.pyplot as plt
import numpy as np
from astropy.io import fits
import squirrel
from squirrel.pipeline import Pipeline
from squirrel.data import Datacube
from speedupy.speedupy import initialize_speedupy, deterministic

@maybe_deterministic
def cell_2():
    data, header = fits.getdata('./data/mock_datacube.fits', header=True)
    noise = fits.getdata('./data/mock_datacube.fits', ext=1)
    return (data, header, noise)

@maybe_deterministic
def cell_3(data, noise):
    plt.plot(data[:, 17, 17])
    plt.plot(noise[:, 17, 17])

@maybe_deterministic
def cell_4(data):
    data.shape

@maybe_deterministic
def cell_5(data, header, noise):
    wavelengths = (header['CRVAL3'] + header['CDELT3'] * (1 + np.arange(header['NAXIS3']))) * 10000.0
    z_lens = 0.3
    z_source = 1.0
    fwhm = (wavelengths[1] - wavelengths[0]) * 2
    center_pixel_x = 17
    center_pixel_y = 17
    coordinate_transform_matrix = np.array([[header['PC1_1'], header['PC1_2']], [header['PC2_1'], header['PC2_2']]]) * header['CDELT1'] * 3600
    datacube = Datacube(wavelengths=wavelengths, flux=data, wavelength_unit='AA', flux_unit=header['BUNIT'], noise=noise, fwhm=fwhm, z_lens=z_lens, z_source=z_source, center_pixel_x=center_pixel_x, center_pixel_y=center_pixel_y, coordinate_transform_matrix=coordinate_transform_matrix)
    return datacube

@maybe_deterministic
def cell_6(datacube):
    plt.imshow(np.sqrt(datacube.x_coordinates ** 2 + datacube.y_coordinates ** 2), origin='lower')
    plt.imshow(np.log10(np.nansum(datacube.flux, axis=0)), origin='lower')

@maybe_deterministic
def cell_7(datacube):
    datacube.reset()
    datacube.deredshift(target_frame='lens')
    datacube.clip(wavelength_min=7500, wavelength_max=9500)
    datacube.flux.shape
    return datacube

@maybe_deterministic
def cell_8(datacube):
    (datacube.spectra_modifications, datacube.wavelengths_frame)

@maybe_deterministic
def cell_9(datacube):
    ax = plt.subplot(111)
    ax.matshow(np.log10(np.nansum(datacube.flux, axis=0)), origin='lower', aspect='equal', cmap='cubehelix')
    ax.set_title('White light image')
    plt.savefig('squirrel1.png')
    ax = plt.subplot(111)
    im = ax.matshow(np.nansum(datacube.flux, axis=0) / np.sqrt(np.nansum(datacube.noise ** 2, axis=0)), origin='lower', aspect='equal', cmap='viridis')
    ax.set_title('SNR image')
    plt.colorbar(im)
    plt.savefig('squirrel2.png')

@maybe_deterministic
def cell_10(datacube):
    ax = plt.subplot(111)
    ax.plot(datacube.wavelengths, datacube.flux[:, 17, 17], label='Data')
    ax.plot(datacube.wavelengths, datacube.noise[:, 17, 17], label='Noise')
    ax.set_xlabel(f'Wavelength ({datacube.wavelength_unit})')
    ax.set_ylabel(f'Flux ({datacube.flux_unit})')
    ax.legend()

@maybe_deterministic
def cell_11(datacube):
    np.random.seed(0)
    signal_image = np.nansum(datacube.flux, axis=0) / np.sqrt(datacube.wavelengths[-1] - datacube.wavelengths[0])
    noise_image = np.sqrt(np.nansum(datacube.noise ** 2, axis=0))
    bin_mapping_outputs = Pipeline.get_voronoi_binning_map(datacube, signal_image_per_wavelength_unit=signal_image, noise_image=noise_image, target_snr=5, max_radius=1, min_snr_per_spaxel=1.0, plot=True, quiet=False)
    return bin_mapping_outputs

@maybe_deterministic
def cell_12(datacube, bin_mapping_outputs):
    voronoi_binned_spectra = Pipeline.get_voronoi_binned_spectra(datacube, bin_mapping_outputs)
    voronoi_binned_spectra.flux.shape
    return voronoi_binned_spectra

@maybe_deterministic
def cell_13(voronoi_binned_spectra):
    for i in range(voronoi_binned_spectra.flux.shape[1]):
        plt.plot(voronoi_binned_spectra.wavelengths, voronoi_binned_spectra.flux[:, i], label=f'Spaxel {i}')
    plt.xlabel(f'Wavelength ({voronoi_binned_spectra.wavelength_unit})')
    plt.ylabel(f'Flux ({voronoi_binned_spectra.flux_unit})')
    plt.legend()
    plt.savefig('squirrel3.png')

@deterministic
def cell_14(voronoi_binned_spectra, func_globals=None):
    voronoi_binned_spectra = Pipeline.log_rebin(voronoi_binned_spectra, num_samples_for_covariance=1000)
    return voronoi_binned_spectra

@maybe_deterministic
def cell_15(datacube, voronoi_binned_spectra):
    (voronoi_binned_spectra.spectra_modifications, datacube.wavelengths_frame)

@maybe_deterministic
def cell_16(voronoi_binned_spectra):
    (voronoi_binned_spectra.flux.shape, voronoi_binned_spectra.wavelengths.shape)

@maybe_deterministic
def cell_17(voronoi_binned_spectra):
    wavelength_range_templates = (voronoi_binned_spectra.wavelengths[0] / 1.2, voronoi_binned_spectra.wavelengths[-1] * 1.2)
    sps_name = 'emiles'
    template_filename = f'spectra_{sps_name}_9.0.npz'
    template = Pipeline.get_template_from_library(template_filename, voronoi_binned_spectra.get_single_spectra(0), velocity_scale_ratio=2, wavelength_factor=1, wavelength_range_extend_factor=1.05)
    print(template.flux.shape)
    return template

@deterministic
def cell_171(voronoi_binned_spectra, template, spectra_indices, func_globals=None):
    return Pipeline.run_ppxf(voronoi_binned_spectra, template, start=[0, 200], degree=12, spectra_indices=spectra_indices, quiet=True)

@maybe_deterministic
def cell_18(voronoi_binned_spectra, template, n):
    for i in range(n):
        ppxf_fit = cell_171(voronoi_binned_spectra, template, i, func_globals=globals())
        ppxf_fit.plot()
        plt.savefig(f'squirrel{i + 4}.png')

@initialize_speedupy
def main():
    n = int(sys.argv[1])
    squirrel.__version__
    data, header, noise = cell_2()
    cell_3(data, noise)
    cell_4(data)
    datacube = cell_5(data, header, noise)
    cell_6(datacube)
    datacube = cell_7(datacube)
    cell_8(datacube)
    cell_9(datacube)
    cell_10(datacube)
    bin_mapping_outputs = cell_11(datacube)
    voronoi_binned_spectra = cell_12(datacube, bin_mapping_outputs)
    cell_13(voronoi_binned_spectra)
    voronoi_binned_spectra = cell_14(voronoi_binned_spectra, func_globals=globals())
    cell_15(datacube, voronoi_binned_spectra)
    cell_16(voronoi_binned_spectra)
    template = cell_17(voronoi_binned_spectra)
    cell_18(voronoi_binned_spectra, template, n)
if __name__ == '__main__':
    main()