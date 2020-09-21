import { useBackend } from '../backend';
import { Button, ColorBox, Section, Table } from '../components';
import { NtosWindow } from '../layouts';

const PROGRAM_ICONS = {
  compconfig: 'cog',
  ntndownloader: 'download',
  filemanager: 'folder',
  smmonitor: 'radiation',
  alarmmonitor: 'bell',
  cardmod: 'id-card',
  arcade: 'gamepad',
  ntnrc_client: 'comment-alt',
  nttransfer: 'exchange-alt',
  powermonitor: 'plug',
  job_manage: 'address-book',
  crewmani: 'clipboard-list',
  robocontrol: 'robot',
  atmosscan: 'thermometer-half',
  shipping: 'tags',
};

export const NtosMain = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    device_theme,
    programs = [],
    has_light,
    light_on,
    comp_light_color,
    removable_media = [],
    login = [],
  } = data;
  return (
    <NtosWindow
      title={device_theme === 'syndicate'
        && 'Главное меню Syndix'
        || 'Главное меню NtOS'}
      theme={device_theme}
      width={400}
      height={500}
      resizable>
      <NtosWindow.Content scrollable>
        {!!has_light && (
          <Section>
            <Button
              width="144px"
              icon="lightbulb"
              selected={light_on}
              onClick={() => act('PC_toggle_light')}>
              Фонарик: {light_on ? 'ВКЛ' : 'ВЫКЛ'}
            </Button>
            <Button
              ml={1}
              onClick={() => act('PC_light_color')}>
              Цвет:
              <ColorBox ml={1} color={comp_light_color} />
            </Button>
          </Section>
        )}
        <Section
          title="Авторизация"
          buttons={(
            <Button
              icon="eject"
              content="Извлечь ID карту"
              disabled={!login.IDName}
              onClick={() => act('PC_Eject_Disk', { name: "ID" })}
            />
          )}>
          <Table>
            <Table.Row>
              Имя владельца: {login.IDName}
            </Table.Row>
            <Table.Row>
              Должность: {login.IDJob}
            </Table.Row>
          </Table>
        </Section>
        {!!removable_media.length && (
          <Section title="Извлечь медиа">
            <Table>
              {removable_media.map(device => (
                <Table.Row key={device}>
                  <Table.Cell>
                    <Button
                      fluid
                      color="transparent"
                      icon="eject"
                      content={device}
                      onClick={() => act('PC_Eject_Disk', { name: device })}
                    />
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        )}
        <Section title="Программы">
          <Table>
            {programs.map(program => (
              <Table.Row key={program.name}>
                <Table.Cell>
                  <Button
                    fluid
                    color="transparent"
                    icon={PROGRAM_ICONS[program.name]
                      || 'window-maximize-o'}
                    content={program.desc}
                    onClick={() => act('PC_runprogram', {
                      name: program.name,
                    })} />
                </Table.Cell>
                <Table.Cell collapsing width="18px">
                  {!!program.running && (
                    <Button
                      color="transparent"
                      icon="times"
                      tooltip="Close program"
                      tooltipPosition="left"
                      onClick={() => act('PC_killprogram', {
                        name: program.name,
                      })} />
                  )}
                </Table.Cell>
                <Table.Cell collapsing width="18px">
                  <Button
                    color="transparent"
                    tooltip="Set Autorun"
                    tooltipPosition="left"
                    selected={program.autorun}
                    onClick={() => act("PC_setautorun", {
                      name: program.name,
                    })}>
                    AR
                  </Button>
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
