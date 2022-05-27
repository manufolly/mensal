obitos <- function(filtro_sistema, filtro_ano, filtro_mes) {
  "https://git.io/JOLeb" %>%
    readr::read_csv2() %>%
    dplyr::mutate(ano = lubridate::year(data), mes = lubridate::month(data)) %>%
    dplyr::group_by(sistema, ano, mes) %>%
    dplyr::summarise(media_volume_porcentagem = base::mean(volume_porcentagem)) %>%
    dplyr::ungroup() %>%
    dplyr::filter(ano == filtro_ano, mes == filtro_mes, sistema == filtro_sistema)
}
