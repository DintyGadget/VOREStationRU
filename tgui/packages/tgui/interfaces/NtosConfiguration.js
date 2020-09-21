import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Box, Button, LabeledList, ProgressBar, Section } from '../components';
import { NtosWindow } from '../layouts';

export const NtosConfiguration = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    PC_device_theme,
    power_usage,
    battery_exists,
    battery = {},
    disk_size,
    disk_used,
    hardware = [],
  } = data;
  return (
    <NtosWindow
      theme={PC_device_theme}
      width={520}
      height={630}
      resizable>
      <NtosWindow.Content scrollable>
        <Section
          title="Источник питания"
          buttons={(
            <Box
              inline
              bold
              mr={1}>
              Потребление: {power_usage}W
            </Box>
          )}>
          <LabeledList>
            <LabeledList.Item
              label="Заряд батареи"
              color={!battery_exists && 'average'}>
              {battery_exists ? (
                <ProgressBar
                  value={battery.charge}
                  minValue={0}
                  maxValue={battery.max}
                  ranges={{
                    good: [battery.max / 2, Infinity],
                    average: [battery.max / 4, battery.max / 2],
                    bad: [-Infinity, battery.max / 4],
                  }}>
                  {battery.charge} / {battery.max}
                </ProgressBar>
              ) : 'Недоступно'}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Файловая система">
          <ProgressBar
            value={disk_used}
            minValue={0}
            maxValue={disk_size}
            color="good">
            {disk_used} GQ / {disk_size} GQ
          </ProgressBar>
        </Section>
        <Section title="Компоненты оборудования">
          {hardware.map(component => (
            <Section
              key={component.name}
              title={component.name}
              level={2}
              buttons={(
                <Fragment>
                  {!component.critical && (
                    <Button.Checkbox
                      content="Включено"
                      checked={component.enabled}
                      mr={1}
                      onClick={() => act('PC_toggle_component', {
                        name: component.name,
                      })} />
                  )}
                  <Box
                    inline
                    bold
                    mr={1}>
                    Энергопотребление: {component.powerusage}W
                  </Box>
                </Fragment>
              )}>
              {component.desc}
            </Section>
          ))}
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
