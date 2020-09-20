import { useBackend } from "../backend";
import { Button, Box, Icon, Flex, LabeledList, Section } from "../components";
import { Window } from "../layouts";
import { FullscreenNotice } from './common/FullscreenNotice';

export const NTNetRelay = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    dos_crashed,
    enabled,
    dos_overload,
    dos_capacity,
  } = data;

  let body = <NTNetRelayContent />;
  
  if (dos_crashed) {
    body = <NTNetRelayCrash />;
  }

  return (
    <Window
      width={dos_crashed ? 700 : 500}
      height={dos_crashed ? 600 : 300}
      resizable>
      <Window.Content scrollable>
        {body}
      </Window.Content>
    </Window>
  );
};

const NTNetRelayContent = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    dos_crashed,
    enabled,
    dos_overload,
    dos_capacity,
  } = data;

  return (
    <Section
      title="Состояние"
      buttons={
        <Button
          icon="power-off"
          selected={enabled}
          content={"Реле " + (enabled ? "Вкл" : "Выкл")}
          onClick={() => act("toggle")} />
      }>
      <LabeledList>
        <LabeledList.Item label="Состояние сетевого буфера">
          {dos_overload} / {dos_capacity} GQ
        </LabeledList.Item>
        <LabeledList.Item label="Настройки">
          <Button
            icon="exclamation-triangle"
            content="Очистить черный список сети"
            onClick={() => act("purge")} />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const NTNetRelayCrash = (props, context) => {
  const { act, data } = useBackend(context);
  
  return (
    <FullscreenNotice title="ОШИБКА">
      <Box fontSize="1.5rem" bold color="bad">
        <Icon
          name="exclamation-triangle"
          verticalAlign="middle"
          size={3}
          mr="1rem"
        />
        <h2>СЕТЕВЫЕ БУФЕРЫ ПЕРЕГРУЖЕНЫ</h2>
        <h3>Режим восстановления после перегрузки</h3>
        <i>
          Эта система временно не работает из-за переполнения буферов трафика.
          Пока буферизованный трафик не будет обработан, все последующие запросы будут отброшены.
          Частые появления этой ошибки могут указывать на недостаточную аппаратную мощность вашей сети.
          За инструкциями по решению этой проблемы обратитесь в отдел планирования сети.
        </i>
        <h3>АДМИНИСТРАТИВНОЕ ПЕРЕНАПРАВЛЕНИЕ</h3>
        <b> ВНИМАНИЕ! Возможна потеря данных. </b>
      </Box>
      <Box>
        <Button
          icon="exclamation-triangle"
          content="Очистить буферизованный трафик"
          onClick={() => act("restart")} />
      </Box>
    </FullscreenNotice>
  );
};