/**
 * #MARK: АТОМ
 */

/**
 * Возвращает русское название атома, склоненное для указанного падежа.
 *
 * Эта процедура обрабатывает склонение русских названий атомов по падежам.
 * Поиск подходящего склоненного имени выполняется в следующем порядке:
 * 1. Предопределенные русские названия атома (ru_names)
 * 2. Кэшированные русские названия из get_ru_names_cached()
 *
 * Если склоненная форма для указанного падежа не найдена (null), возвращает имя по умолчанию.
 *
 * Аргументы:
 * * case_id - Идентификатор падежа из дефайнов русского языка (напр. [NOMINATIVE], [GENITIVE] и т.д.)
 */
/atom/proc/declent_ru(case_id)
	var/list/list_to_use = ru_names || get_ru_names_cached()
	if(length(list_to_use))
		return list_to_use[case_id] || name
	return name

/**
 * Получить варианты русского названия в грамматических падежах.
 *
 * Переопределите этот метод, чтобы вернуть ассоциативный список
 * с идентификаторами падежей и соответствующими русскими названиями.
 * Используется функцией declent_ru() для поиска названий по падежам.
 */
/atom/proc/get_ru_names()
	return

/**
 * Получить кешированные русские названия для данного типа атомов.
 *
 * Сначала проверяет глобальный кеш на наличие русских названий для данного типа.
 * Если не найдено, вызывает get_ru_names() и кеширует результат для последующих вызовов.
 */
/atom/proc/get_ru_names_cached()
	var/list/names = GLOB.cached_ru_names[type]
	if(names)
		return names
	names = get_ru_names()
	if(names)
		GLOB.cached_ru_names[type] = names
		return names
	return

/**
 * #MARK: МАТЕРИАЛ
 * Отличие от системы перевода Атомов в том, что изменён родитель с /atom на /datum
 * По этому используется тот же лист var/list/list_to_use = ru_names
 */

/datum/material/proc/declent_ru(case_id)
	var/list/list_to_use = ru_names || get_ru_names_cached()
	if(length(list_to_use))
		return list_to_use[case_id] || name
	return name

/datum/material/proc/get_ru_names()
	return

/datum/material/proc/get_ru_names_cached()
	var/list/names = GLOB.cached_ru_names[type]
	if(names)
		return names
	names = get_ru_names()
	if(names)
		GLOB.cached_ru_names[type] = names
		return names
	return

/**
 * #MARK: Части тела
 * Части тела, а именно зоны (plaintext_zone), не получится перевести как атомы, по этому отдельно.
 */

/**
 * Возвращает русское название plaintext_zone, склоненное для указанного падежа.
 */
/obj/item/bodypart/proc/declent_plaintext_ru(case_id)
	var/list/list_to_use = ru_plaintext_names || get_ru_plaintext_names_cached()
	if(length(list_to_use))
		return list_to_use[case_id] || plaintext_zone
	return plaintext_zone

/**
 * Получить варианты русского plaintext_zone в грамматических падежах.
 */
/obj/item/bodypart/proc/get_ru_plaintext_names()
	return

/**
 * Получить кешированные русские plaintext_zone для данного типа bodypart.
 */
/obj/item/bodypart/proc/get_ru_plaintext_names_cached()
	var/list/names = GLOB.cached_ru_plaintext_names[type]
	if(names)
		return names
	names = get_ru_plaintext_names()
	if(names)
		GLOB.cached_ru_plaintext_names[type] = names
		return names
	return
