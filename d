"use client"

import { useState, MouseEvent, useEffect, forwardRef } from 'react';
import { useTheme } from '@mui/material/styles';
import Chip from '@mui/material/Chip';
import Menu from '@mui/material/Menu';
import Stack from '@mui/material/Stack';
import Typography from '@mui/material/Typography';
import ListItemButton from '@mui/material/ListItemButton';
import { Box } from '@mui/material';
import { IconButton } from '@mui/material';
import ReactApexChart, { Props as ChartProps } from 'react-apexcharts';

// MoreIcon component
const MoreIcon = () => {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      strokeWidth="2"
      stroke="currentColor"
      fill="none"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path stroke="none" d="M0 0h24v24H0z" fill="none" />
      <path d="M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
      <path d="M12 19m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
      <path d="M12 5m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
    </svg>
  );
};

// Chart options
const areaChartOptions = {
  chart: {
    type: 'area',
    toolbar: {
      show: false
    }
  },
  dataLabels: {
    enabled: false
  },
  stroke: {
    width: 1
  },
  fill: {
    type: 'gradient',
    gradient: {
      shadeIntensity: 1,
      type: 'vertical',
      inverseColors: false,
      opacityFrom: 0.5,
      opacityTo: 0
    }
  },
  plotOptions: {
    bar: {
      columnWidth: '45%',
      borderRadius: 4
    }
  },
  grid: {
    strokeDashArray: 4
  }
};

// SymptomsChart component
const SymptomsChart = () => {
  const theme = useTheme();

  const mode = theme.palette.mode;
  const { primary, secondary } = theme.palette.text;
  const line = theme.palette.divider;

  const [options, setOptions] = useState<ChartProps>(areaChartOptions);

  useEffect(() => {
    setOptions((prevState) => ({
      ...prevState,
      colors: [theme.palette.primary.main, theme.palette.primary.dark],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        labels: {
          style: {
            colors: Array(12).fill(secondary)
          }
        },
        axisBorder: {
          show: false,
          color: line
        },
        axisTicks: {
          show: false
        },
        tickAmount: 11
      },
      yaxis: {
        labels: {
          style: {
            colors: [secondary]
          }
        }
      },
      grid: {
        borderColor: line
      },
      theme: {
        mode: mode === 'dark' ? 'dark' : 'light'
      }
    }));
  }, [mode, primary, secondary, line, theme]);

  const [series] = useState([
    {
      name: 'Symptom Severity',
      data: [30, 60, 40, 70, 50, 90, 50, 55, 45, 60, 50, 65]
    }
  ]);

  return <ReactApexChart options={options} series={series} type="area" height={260} />;
};

// SymptomsTracker component
const SymptomsTracker = () => {
  const [anchorEl, setAnchorEl] = useState<null | HTMLElement>(null);
  const open = Boolean(anchorEl);

  const handleClick = (event: MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <Box sx={{ p: 2, m: 2, border: '1px solid #e0e0e0', borderRadius: '8px' }}>
      <Stack direction="row" alignItems="center" justifyContent="space-between" spacing={1}>
        <Typography variant="h5">Symptoms Tracker</Typography>
        <IconButton
          color="secondary"
          id="symptoms-button"
          aria-controls={open ? 'symptoms-menu' : undefined}
          aria-haspopup="true"
          aria-expanded={open ? 'true' : undefined}
          onClick={handleClick}
          sx={{ transform: 'rotate(90deg)' }}
        >
          <MoreIcon />
        </IconButton>
        <Menu
          id="symptoms-menu"
          anchorEl={anchorEl}
          open={open}
          onClose={handleClose}
          MenuListProps={{
            'aria-labelledby': 'symptoms-button',
            sx: { p: 1.25, minWidth: 150 }
          }}
          anchorOrigin={{
            vertical: 'bottom',
            horizontal: 'right'
          }}
          transformOrigin={{
            vertical: 'top',
            horizontal: 'right'
          }}
        >
          <ListItemButton onClick={handleClose}>Today</ListItemButton>
          <ListItemButton onClick={handleClose}>Weekly</ListItemButton>
          <ListItemButton onClick={handleClose}>Monthly</ListItemButton>
        </Menu>
      </Stack>
      <Stack direction="row" alignItems="center" justifyContent="flex-end" spacing={0.5} sx={{ mt: 1 }}>
        <Typography variant="subtitle1">Severity</Typography>
        <Chip color="success" variant="filled" label="Mild" size="small" sx={{ bgcolor: 'success.main', borderRadius: 1 }} />
      </Stack>
      <SymptomsChart />
    </Box>
  );
};

export default SymptomsTracker;
